import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input" ]
  connect() {
    const input = this.inputTarget;
    // console.log("hellow");
  input.addEventListener("keydown", (e) => {
  if (e.key === "Backspace" || e.key === "Delete") return
  if (e.target.value.length === 3) {
    input.value = input.value + "-"
  }
  if (e.target.value.length === 7) {
    input.value = input.value + "-"
  }
  if(e.target.value.length === 14) {
      input.value = input.value + "-";
  }
}

)
  }
}
