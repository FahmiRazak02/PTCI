<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate Total Price</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        #container {
            width: 500px;
            margin: 0 auto;
        }
        h1, h2 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        fieldset {
            border: none;
            margin: 0;
            padding: 0;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="checkbox"] {
            margin-right: 8px;
        }
        #homeButton {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        #qrCodeImage {
            display: none;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>Calculate Total Price</h1>
        <form id="nameForm">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName">
        </form>
        <form id="priceForm">
            <fieldset>
                <legend>Selected Subjects:</legend>
                <label><input type="checkbox" name="subjects" value="English" onclick="calculateTotal()"> English ($50)</label><br>
                <label><input type="checkbox" name="subjects" value="Math" onclick="calculateTotal()"> Math ($60)</label><br>
                <label><input type="checkbox" name="subjects" value="Science" onclick="calculateTotal()"> Science ($50)</label><br>
                <label><input type="checkbox" name="subjects" value="Bahasa Melayu" onclick="calculateTotal()"> Bahasa Melayu ($40)</label><br>
            </fieldset>
        </form>
        <h2>Total Price: RM<span id="totalPrice">0.00</span></h2>
        <form action="processPayment.jsp" method="post">
            <input type="hidden" id="hiddenTotalPrice" name="totalPrice">
            <label for="paymentMethod">Choose Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" onchange="togglePaymentDetails()">
                <option value="none">Select Payment Method</option>
                <option value="qrCode">QR Code</option>
                <option value="cardPayment">Card Payment</option>
            </select>
           
        </form>
        <a href="index.jsp" id="homeButton">Home</a>
        <div id="qrCodeImage" style="display: none;">
            <img src="qr2.jpg" alt="QR Code Image">
            <form action="processQRPayment.jsp" method="post">
                <input type="file" name="paymentImage" accept="image/*">
                <input type="submit" value="Submit Payment Image">
            </form>
        </div>
        <div id="cardDetails" style="display: none;">
            <form class="credit-card">
  <div class="form-header">
    <h4 class="title">Credit card detail</h4>
  </div>
 
  <div class="form-body">
    <!-- Card Number -->
    <input type="text" class="card-number" placeholder="Card Number">
 
    <!-- Date Field -->
    <div class="date-field">
      <div class="month">
        <select name="Month">
          <option value="january">January</option>
          <option value="february">February</option>
          <option value="march">March</option>
          <option value="april">April</option>
          <option value="may">May</option>
          <option value="june">June</option>
          <option value="july">July</option>
          <option value="august">August</option>
          <option value="september">September</option>
          <option value="october">October</option>
          <option value="november">November</option>
          <option value="december">December</option>
        </select>
      </div>
      <div class="year">
        <select name="Year">
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
          <option value="2020">2020</option>
          <option value="2021">2021</option>
          <option value="2022">2022</option>
          <option value="2023">2023</option>
          <option value="2024">2024</option>
        </select>
      </div>
    </div>
 
    <!-- Card Verification Field -->
    <div class="card-verification">
      <div class="cvv-input">
        <input type="text" placeholder="CVV">
      </div>
      <div class="cvv-details">
        <p>3 or 4 digits usually found <br> on the signature strip</p>
      </div>
    </div>
 
    <!-- Buttons -->
    <button type="submit" class="proceed-btn"><a href="#">Proceed</a></button>
  </div>
</form>
        </div>
    </div>
    <script>
        function calculateTotal() {
            let checkboxes = document.querySelectorAll('input[name="subjects"]:checked');
            let totalPrice = 0;

            checkboxes.forEach(function(checkbox) {
                switch (checkbox.value) {
                    case "English":
                        totalPrice += 50;
                        break;
                    case "Math":
                        totalPrice += 60;
                        break;
                    case "Science":
                        totalPrice += 50;
                        break;
                    case "Bahasa Melayu":
                        totalPrice += 40;
                        break;
                    default:
                        break;
                }
            });

            document.getElementById("totalPrice").textContent = totalPrice.toFixed(2);
            document.getElementById("hiddenTotalPrice").value = totalPrice.toFixed(2);
        }
        

        function togglePaymentDetails() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var qrCodeImage = document.getElementById("qrCodeImage");
            var cardDetails = document.getElementById("cardDetails");
            if (paymentMethod === "qrCode") {
                qrCodeImage.style.display = "block";
                cardDetails.style.display = "none";
            } else if (paymentMethod === "cardPayment") {
                qrCodeImage.style.display = "none";
                cardDetails.style.display = "block";
            } else {
                qrCodeImage.style.display = "none";
                cardDetails.style.display = "none";
            }
        }
    </script>
</body>
</html>