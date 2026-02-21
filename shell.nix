{ pkgs ? import <nixpkgs> {} }:

let
  elixir = pkgs.beam.packages.erlang_27.elixir_1_17;
in
pkgs.mkShell {
  buildInputs = [
    elixir
    pkgs.postgresql_16
    pkgs.inotify-tools
  ];

  shellHook = ''
    # 1. Localize Mix/Hex so they don't pollute your home dir
    export MIX_HOME=$PWD/.nix-mix
    export HEX_HOME=$PWD/.nix-hex
    export PATH=$MIX_HOME/bin:$HEX_HOME/bin:$PATH

    # 2. Automated Postgres Config
    export PGDATA=$PWD/.nix-db
    export PGHOST=$PWD/.nix-db-sockets
    mkdir -p $PGHOST

    if [ ! -d "$PGDATA" ]; then
      initdb --auth=trust -D $PGDATA
      # Configure Postgres to use the local socket directory
      echo "unix_socket_directories = '$PGHOST'" >> $PGDATA/postgresql.conf
    fi

    # Start Postgres automatically
    if ! pg_ctl status >/dev/null; then
      pg_ctl start -l $PGDATA/server.log -o "-k $PGHOST"
    fi

    # 3. Connection String for Phoenix
    # This tells Phoenix to talk to the local Nix-managed socket
    export DATABASE_URL="postgresql://postgres@localhost/dev?host=$PGHOST"

    echo "--- Postgres is LIVE ---"
    echo "DB Socket: $PGHOST"
    
    # Auto-stop when you exit the shell
    trap "pg_ctl stop" EXIT
  '';
}