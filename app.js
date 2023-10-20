// const express = require("express");
// const socket = require("socket.io");
// const app = express();
// require("dotenv").config();
// const port = process.env.PORT || 5000;
// app.use(express.static("web"));
// app.get("/", (req, res) => {
//   return res.json({
//     message: "Hoşgeldiniz",
//   });
// });

// const server = app.listen(port);
// const io = socket(server);

// io.on("connection", (socket) => {
//   console.log("Kullanıcının Id : ", socket.id);

//   socket.on("chat", (data) => {
//     // chat bizim front tarafından emit yöntemi ile gönderdiğimiz value adı 'chat' valusini dinliyoruz.
//     // bizim datadan gelen verileri bütün browserları göndermemiz gerekiyor.
//     io.sockets.emit("chat", data);
//   });

//   socket.on("disconnect", () => {
//     console.log("bir istemci bağlantısı koptu.");
//   });

//   socket.on("typing", (data) => {
//     io.sockets.emit("typing", data);
//   });
// });
const express = require("express");
const socket = require("socket.io");
const app = express();
require("dotenv").config();
const port = process.env.PORT || 5000;
app.use(express.static("web"));
app.get("/", (req, res) => {
  return res.json({
    message: "Hoşgeldiniz",
  });
});

const server = app.listen(port);
const io = socket(server);

io.on("connection", (socket) => {
  console.log("Kullanıcının Id : ", socket.id);

  socket.on("joinRoom", (roomName) => {
    socket.join(roomName);
  });
  // Odaya özgü mesajları dinle ve iletilen odada yayınla
  socket.on("chat", (data) => {
    console.log(data);
    io.to(data["tenant_id"]).emit("chat", data);
  });

  socket.on("typing", (data) => {
    io.to(data["roomValue"]).emit("typing", data);
  });

  socket.on("disconnect", () => {
    console.log("bir istemci bağlantısı koptu.");
  });
});
