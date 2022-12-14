import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = [ "toggler", "panel" ]
  toggle () {
	this.element.classList.toggle("ml-96")
  	this.panelTarget.classList.toggle("-translate-x-full")
  }
}
