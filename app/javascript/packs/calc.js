window.addEventListener('load',()=>{
  const inputPriceElm = document.getElementById('item-price');
  const addTaxPriceElm = document.getElementById('add-tax-price');
  const profitElm = document.getElementById('profit');
  
  inputPriceElm.addEventListener('input',(event)=>{
    const taxPrice = Math.floor(event.target.value * 0.1);
    addTaxPriceElm.textContent = taxPrice;
    profitElm.textContent = event.target.value - taxPrice;
  })
})
