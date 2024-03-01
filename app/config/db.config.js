module.exports = {
  HOST: "localhost",
  USER: "root",
  PASSWORD: "",
  DB: "webes_utazas_lg_tv",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
