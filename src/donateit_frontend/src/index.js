import { donateit_backend } from "../../declarations/donateit_backend/";

window.addEventListener("load", async function () {
  update();
});

document.addEventListener("DOMContentLoaded", function() {
  const form = document.querySelector("form");
  
  if (form) {
    form.addEventListener("submit", async function (e) {
      e.preventDefault();
      
      const button = e.target.querySelector("#submit-btn");
      
      if (button) {
        button.setAttribute("disabled", true);
      }

      const inputAmountElement = document.getElementById("input-amount");
     

      const inputAmount = inputAmountElement ? parseFloat(inputAmountElement.value) : NaN;
      
      try {
        if (inputAmountElement && inputAmountElement.value.length != 0) {
          await donateit_backend.transfer(inputAmount);
        }
        

        update();
        if (inputAmountElement) inputAmountElement.value = "";
       
      } catch (error) {
        console.error("Error during form submission:", error);
      } finally {
        if (button) {
          button.removeAttribute("disabled");
        }
      }
    });
  } else {
    console.error("Form element not found");
  }
});

async function update() {
  try {
    const crrAmount = await donateit_backend.totalFund();
    const valueElement = document.getElementById("value");
    
    if (valueElement) {
      valueElement.innerText = crrAmount.toFixed(2);
    } else {
      console.error("Value element not found");
    }
  } catch (error) {
    console.error("Error during update:", error);
  }
}
