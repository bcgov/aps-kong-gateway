return {
    postgres = {
      up = [[
        CREATE TABLE IF NOT EXISTS "runtime_groups" (
          "id"                 UUID PRIMARY KEY,
          "created_at"         TIMESTAMP WITHOUT TIME ZONE,
          "name"               TEXT,
          "namespaces"         TEXT[],
          "features"           TEXT[],
          "hosts"              TEXT[],
          "acme_account_email" TEXT
        );
  
        DO $$
        BEGIN
          CREATE UNIQUE INDEX IF NOT EXISTS "runtime_groups_name"
                                  ON "runtime_groups" ("name");
        EXCEPTION WHEN UNDEFINED_COLUMN THEN
          -- Do nothing, accept existing state
        END$$;
      ]],
    },
    cassandra = {
        up = [[]]
    }
}