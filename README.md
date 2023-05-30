# Box
Create database:

```sh
$ mix phx.gen.json Files File box_files \
name:string:unique type:string

...

$ mix.migrate
```

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Usage example

```sh
# Add file
% curl -H "Content-Type: application/json"\
-X POST -d '{"file": {"name": "simple_directory", "type": "dir"}}'\
 http://localhost:4000/api/box_files

# Response:
{"data":{"id":"f31e2c4d-174e-463b-b8b4-d943d1873529","name":"simple_directory","type":"dir"}}

---- 

# Edit file
curl -H "Content-Type: application/json" -X PUT -d '{"file": {"name": "simple_directory_two", "type": "dir"}}'\
 http://localhost:4000/api/box_files/f31e2c4d-174e-463b-b8b4-d943d1873529

# Response
{"data":{"id":"f31e2c4d-174e-463b-b8b4-d943d1873529","name":"simple_directory_two","type":"dir"}}

----

# Remove file
curl -H "Content-Type: application/json" -X DELETE http://localhost:4000/api/box_files/f31e2c4d-174e-463b-b8b4-d943d1873529

# Response
None

---

# Get file
curl -H "Content-Type: application/json" http://localhost:4000/api/box_files/f31e2c4d-174e-463b-b8b4-d943d1873529

# Response
{"data":{"id":"f31e2c4d-174e-463b-b8b4-d943d1873529","name":"simple_directory","type":"dir"}}

---

# Get Files
curl -H "Content-Type: application/json" http://localhost:4000/api/box_files

# Response
{"data":[{"id":"f31e2c4d-174e-463b-b8b4-d943d1873529","name":"simple_directory","type":"dir"}]}%

```
