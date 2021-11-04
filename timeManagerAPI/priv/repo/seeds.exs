# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimeManagerAPI.Repo.insert!(%TimeManagerAPI.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TimeManagerAPI.Repo
alias TimeManagerAPI.Accounts.User

user1 =
  Repo.insert!(%User{
    email: "user1@gmail.com",
    username: "user1",
    password: "testpassword",
    role: "manager"
  })

Repo.insert!(%User{
  email: "user2@test.com",
  username: "user2",
  password: "testpassword",
  role: "admin"
})

Repo.insert!(%User{
  email: "user3@wanadoo.fr",
  username: "user3",
  password: "testpassword",
  role: "employee"
})

alias TimeManagerAPI.Clocks.Clock

{:ok, datetime, 0} = DateTime.from_iso8601("2021-10-26T23:50:07Z")
Repo.insert!(%Clock{status: true, time: datetime, user_id: user1.id})

{:ok, datetime2, 0} = DateTime.from_iso8601("2021-10-27T06:10:00Z")
Repo.insert!(%Clock{status: true, time: datetime2, user_id: user1.id})

alias TimeManagerAPI.Workingtimes.Workingtime

{:ok, datetime3, 0} = DateTime.from_iso8601("2021-10-26T01:00:00Z")
{:ok, datetime4, 0} = DateTime.from_iso8601("2021-10-26T23:59:59Z")
Repo.insert!(%Workingtime{start: datetime3, end: datetime4, user_id: user1.id})

{:ok, datetime5, 0} = DateTime.from_iso8601("2021-10-27T01:00:00Z")
{:ok, datetime6, 0} = DateTime.from_iso8601("2021-10-27T23:59:59Z")
Repo.insert!(%Workingtime{start: datetime5, end: datetime6, user_id: user1.id})
