import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = [ "toggler", "panel" ]
  toggle () {
  	this.panelTarget.classList.toggle("-translate-x-full")
  }
}
