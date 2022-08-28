const serverport = 3000;

const express = require("express");
const app = express();
const sql = require("mssql");
var cors = require("cors");
const xmlparser = require("express-xml-bodyparser");
var config = require('./config');
app.use(xmlparser());


sql.connect(config, function (err) {
    // console.log(err);
});

app.use(cors());

app.use(express.static(__dirname + "/public"));
app.use(express.json());
app.post("/api/login", function (req, res) {
    console.log("login request");

    let username = req.body.username;
    let password = req.body.password;

    let request = new sql.Request();
    let query =
        "Select * From [users] WHERE username ='" + username + "' AND password = '" + password + "'";
    console.log(query)
    request.query(query, (err, result) => {
        if (err) throw err;
        if (result && result.recordset && result.recordset.length > 0) {
            console.log(result.recordset);
            res.send(result.recordset);
        } else {
            res.send([]);
        }
    });
});
app.get("/api/users/list", function (req, res) {
    let table = "users";
    let request = new sql.Request();
    let query = "SELECT * FROM [" + table + "]";

    request.query(query, (err, result) => {
        if (err) throw err;
        if (result && result.recordset && result.recordset.length > 0) {
            res.send(result.recordset);
        } else {
            res.send([]);
        }
    });
});

/********************/
/**Questions Crud***/
/******************/
app.get("/api/questions/list", function (req, res) {
    let table = "questions";
    let request = new sql.Request();
    let query = "SELECT * FROM [" + table + "]";

    request.query(query, (err, result) => {
        if (err) throw err;
        if (result && result.recordset && result.recordset.length > 0) {
            res.send(result.recordset);
        } else {
            res.send([]);
        }
    });
});
app.post("/api/question/insert", function (req, res) {
    let question = req.body.question;
    let status = req.body.status ? req.body.status : 1;

    let request = new sql.Request();
    request.input("question", sql.Text, question);
    request.input("status", sql.Int, status);
    let query_insert =
        "INSERT INTO [questions] (question,status) OUTPUT Inserted.Id VALUES (@question,@status)";
    request.query(query_insert, (err1, result1) => {
        if (err1) throw err1;
        console.log("question saved");
        res.send(JSON.stringify({ status: "success" }));
    });
});
app.put("/api/question/update", function (req, res) {
    let question_id = req.body.Id;
    let question = req.body.question;
    let status = req.body.status ? req.body.status : 1;

    let request = new sql.Request();
    request.input("question", sql.Text, question);
    request.input("status", sql.Int, status);
    request.input("question_id", sql.Int, question_id);

    let query_update =
        "UPDATE [questions] SET question=@question, status = @status WHERE Id = @question_id";

    request.query(query_update, (err1, result1) => {
        if (err1) throw err1;
        console.log("updated");
        res.send(JSON.stringify({ status: "success" }));
    });
});

app.get("/api/question/:Id", function (req, res) {
    console.log("byid request");
    let Id = req.params.Id;
    let table = "questions";
    let request = new sql.Request();
    let query = "SELECT * FROM [" + table + "] WHERE Id=" + Id;
    request.query(query, (err, result) => {
        if (err) throw err;
        if (result && result.recordset && result.recordset.length > 0) {
            res.send(result.recordset);
        } else {
            res.send([]);
        }
    });
});
app.delete("/api/question/:Id", function (req, res) {
    console.log("delete quest request");

    let id = req.params.Id;
    let request = new sql.Request();
    let query = "DELETE FROM [questions] WHERE Id = @question_id";
    request.input("question_id", sql.Int, id);

    request.query(query, (err, result) => {
        if (err) throw err;
        if (result) {
            console.log("question deleted");
            res.send(JSON.stringify({ status: "success" }));
        }
    });
});

/********************/
/**Answers***/
/******************/

app.get("/api/answers/list", function (req, res) {
    let table = "answers";
    let request = new sql.Request();
    let query = "SELECT * FROM [" + table + "]";

    request.query(query, (err, result) => {
        if (err) throw err;
        if (result && result.recordset && result.recordset.length > 0) {
            res.send(result.recordset);
        } else {
            res.send([]);
        }
    });
});

app.post("/api/answers/insert", function (req, res) {
    let answers = JSON.stringify(req.body.answers);
    let name = req.body.user_name;
    let email = req.body.user_email;

    let request = new sql.Request();
    request.input("answers", sql.Text, answers);
    request.input("name", sql.VarChar, name);
    request.input("email", sql.VarChar, email);

    let query_insert =
        "INSERT INTO [answers] (answers_data,user_name,user_email) OUTPUT Inserted.Id VALUES (@answers,@name,@email)";
    request.query(query_insert, (err1, result1) => {
        if (err1) throw err1;
        console.log("question saved");
        res.send(JSON.stringify({ status: "success" }));
    });
});

app.listen(serverport);
console.log("Question System: Server Running Port: " + serverport);