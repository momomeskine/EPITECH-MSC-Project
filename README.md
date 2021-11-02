# Time Manager

#### Time management application

## 💾 Install TimeManager


#### 📡 Add deps
We will need to install the Hex, the Elixir package manager as well, this could be done by running : `mix local.hex`

Installing Phoenix : `mix archive.install hex phx_new 1.5.13`

Download deps : `mix deps.get`

Install new dep : modify the `mix.exs` file

You'll need to install npm & run npm install in front folder.

After that you can run the docker-compose with the following command : `docker-compose up` If you prefer to build directly docker, you can just run `docker-compose -f docker-compose-build.yml up --build`

### 🛠 Troubleshooting

In Docker-compose all file are mounted for live-developpement. So be careful to get all dependencies on your host before running containers. If you just want to run them, remove volumes mounted in api & front services in `docker-compose.yml`

#### For linux 🐧
`???`

---

#### Project realised by:
- **[@Alix N.](https://github.com/AlixNtm)**
- **[@Mathis T.](https://github.com/mathis3thomas8)**
- **[@Mohamed M.](https://github.com/datVaulting)**
- **[@Théo C.](https://github.com/GreenDjango)**
