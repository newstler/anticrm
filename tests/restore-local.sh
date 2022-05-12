
export MINIO_ACCESS_KEY=minioadmin
export MINIO_SECRET_KEY=minioadmin
export MINIO_ENDPOINT=localhost:9000
export MONGO_URL=mongodb://localhost:27017
export TRANSACTOR_URL=ws:/localhost:3333
export ELASTIC_URL=http://localhost:9200


# Restore workspace contents in mongo/elastic
node ../dev/tool/bundle.js restore-workspace sanity-ws sanity-ws/

# Re-assign user to workspace.
node ../dev/tool/bundle.js assign-workspace user1 sanity-ws