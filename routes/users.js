var express = require("express");
var router = express.Router();

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

module.exports = router;
var express = require("express");
var router = express.Router();

/* GET home page. */
//라우터의 get()함수를 이용해 request URL('/')에 대한 업무처리 로직 정의
router.get("/", function (req, res) {
  res.render("main/index", { title: "Express" });
});

router.get("/1", function (req, res) {
  res.render("main/login", { title: "Express" });
});

//모듈에 등록해야 app.js에서 app.use 함수를 통해서 사용 가능
module.exports = router;