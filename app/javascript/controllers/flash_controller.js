import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('COnnect')

    setTimeout(() => {
      this.element.classList.add("opacity-0")
    }, 2350);
    setTimeout(() => {
      // this.element.remove()
    }, 3550);
  }
}
