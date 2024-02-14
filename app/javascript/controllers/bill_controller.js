import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const quantity = this.element.value;
    const mealPrice = parseFloat(this.data.get("mealPrice"));
    const totalCostElement = document.querySelector(this.data.get("target"));
  }
  updateTotalCost() {
    
    if (!isNaN(quantity) && !isNaN(mealPrice) && totalCostElement) {
      const totalCost = mealPrice * quantity;
      totalCostElement.innerText = totalCost.toFixed(2);
    }
  }
}
