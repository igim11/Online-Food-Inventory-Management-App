import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity", "mealPrice", "totalCost"];

  connect() {
    this.calculateTotalCost();
  }

  calculateTotalCost() {
    const quantity = parseInt(this.quantityTarget.value);
    const mealPrice = parseFloat(this.mealPriceTarget.textContent);
    const totalCost = quantity * mealPrice;

    this.totalCostTarget.textContent = `Total Cost: $${totalCost.toFixed(2)}`;
  }

  updateTotalCost() {
    this.calculateTotalCost();
  }
}