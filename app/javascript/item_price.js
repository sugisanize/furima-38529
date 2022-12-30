window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxCharge = Math.floor(inputValue*0.1)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = taxCharge;
    
    const priceProfit = document.getElementById("profit");
    priceProfit.innerHTML = inputValue - taxCharge;
  });
});