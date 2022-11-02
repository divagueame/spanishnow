import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested"
export default class extends Controller {

  static targets = [ "piece" ]

  addField(e) {
    // Allows add field on enter key
    if(e.type==='keyup' && e.key!=='Enter'){ return }

    // Copy last piece element
    let lastPiece = this.pieceTargets[this.pieceTargets.length - 1];
    let newPiece  = lastPiece.cloneNode(true); 
    
    // Update the form name and value
    for (let i = 0; i < newPiece.getElementsByTagName('input').length; i++) {      
       newPiece.getElementsByTagName('input')[i].name = newPiece.getElementsByTagName('input')[i].name.replace( /\[\d+\]/g, `[${this.pieceTargets.length}]`);
       newPiece.getElementsByTagName('input')[i].value = "";
    } 

    // Insert last to the form
    lastPiece.after(newPiece)
    newPiece.getElementsByTagName('input')[0].focus()
  }

  removeField(e) {
    // Allows remove field on escape key
    if(e.type==='keyup' && e.key!=='Escape'){ return }
  
    if(this.pieceTargets.length>1){
      e.target.closest('.piece').remove()
      let lastPiece = this.pieceTargets[this.pieceTargets.length - 1];      
      lastPiece.getElementsByTagName('input')[0].focus()
    }
  }



}
