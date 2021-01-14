window.addEventListener('load', () => {
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue * 0.9);
})
