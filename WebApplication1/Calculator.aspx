<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="WebApplication1.Calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calculator</title>

    <!-- Vendor CSS Files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-icons/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/css2?family=Saira:wght@400;500;600&display=swap" rel="stylesheet"/>


    <!-- Custom CSS -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Saira", sans-serif;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .header {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            width: 100%;
        }

            .header img {
                height: 50px;
                margin-right: 10px;
            }

            .header h1 {
                font-size: 24px;
                margin: 0;
                color: #495057;
            }

        .container-fluid {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 190px;
        }

        .calculator {
            max-width: 400px;
            width: 100%; 
            padding: 20px;
            background: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .screen {
            width: 100%;
            height: 60px;
            margin-bottom: 10px;
            text-align: right;
            font-size: 2rem;
            padding: 10px;
            border-radius: 6px;
            background-color: white;
            border: 1px solid #ddd;
        }

        .btn {
            width: 100%;
            height: 60px;
            font-size: 1.5rem;
            border: none;
            margin: 5px 0;
        }

        .btn-ac {
            background-color: #f44336;
            color: white;
        }

        .btn-op {
            background-color: #10a37f;
            color: white;
        }

        .btn-num {
            background-color: #e0e0e0;
        }

        .btn-equal {
            background-color: #ff9800;
            color: white;
        }

        @media screen and (max-width: 576px) {
            .screen {
                font-size: 1.5rem;
            }

            .btn {
                font-size: 1.2rem;
            }
        }
    </style>

    <script>
        let screen = '';
        function appendValue(value) {
            screen += value;
            document.getElementById('result').value = screen;
        }

        function calculate() {
            try {
                screen = eval(screen);
                document.getElementById('result').value = screen;
            } catch (e) {
                document.getElementById('result').value = 'Error';
            }
        }

        function clearScreen() {
            screen = '';
            document.getElementById('result').value = '';
        }

        function backspace() {
            screen = screen.slice(0, -1);
            document.getElementById('result').value = screen;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <img src="assets/img/calculator_1325970.png" alt="Calculator Icon" />
            <h1>Calculator</h1>
        </div>
        <div class="container-fluid">
            <!-- Calculator Body -->
            <div class="calculator">
                <input type="text" id="result" class="screen form-control" readonly="" />

                <div class="row">
                    <div class="col-3">
                        <button type="button" class="btn btn-ac" onclick="clearScreen()">AC</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="backspace()">⌫</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="appendValue('%')">%</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="appendValue('/')">÷</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('7')">7</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('8')">8</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('9')">9</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="appendValue('*')">×</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('4')">4</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('5')">5</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('6')">6</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="appendValue('-')">−</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('1')">1</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('2')">2</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('3')">3</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-op" onclick="appendValue('+')">+</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-num" onclick="appendValue('0')">0</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-num" onclick="appendValue('.')">.</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="btn btn-equal" onclick="calculate()">=</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Back button handling script -->
    <script type="text/javascript">
        window.onpopstate = function (event) {
            window.location.href = 'WebPage.aspx'; 
        };

        window.onload = function () {
            if (history.state === null) {
                history.pushState({}, 'Calculator', window.location.href);
            }

            const img = document.querySelector('.header img');
            const h1 = document.querySelector('.header h1');

            img.style.transition = 'transform 1s ease-in-out';
            h1.style.transition = 'transform 1s ease-in-out 0.2s'; 

            img.style.transform = 'translateX(0)';
            h1.style.transform = 'translateX(0)';
        };

        window.addEventListener('DOMContentLoaded', function () {
            const img = document.querySelector('.header img');
            const h1 = document.querySelector('.header h1');

            img.style.transform = 'translateX(100%)';
            h1.style.transform = 'translateX(100%)';
        });
    </script>

</body>
</html>
