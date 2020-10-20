window.addEventListener ('load', function () {
  const path = location.pathname

  if( "/items/new" === path || "/items" === path || path.includes("items" && "edit")) {
    const itemPrice = document.getElementById("item-price")
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
  
    itemPrice.addEventListener('input', function () {
        const price = document.getElementById("item-price").value
        tax.innerHTML = Math.floor(.1 * price)
        profit.innerHTML = Math.floor(.9 * price)
      });
  };
})