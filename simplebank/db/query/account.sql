-- name: CreateAccount :one
insert into accounts
    (owner, balance, currency)
values ($1,$2,$3)
    returning *;

-- name: GetAccount :one
select * from accounts
where id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * from accounts
order by id
    LIMIT $1
offset $2;

-- name: UpdateAccounts :exec
update accounts
set balance = $2
where id = $1;