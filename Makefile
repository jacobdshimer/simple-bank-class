createdb:
	docker exec -it backend-master-class-backend-1 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it backend-master-class-backend-1 dropdb simple_bank

migrateup:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test: 
	go test -v -cover ./...

.PHONY: createdb dropdb migrateup migratedown sqlc test