import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested"
export default class extends Controller {

  static targets = [ "piece" ]

  addField(e) {
    e.preventDefault()

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

    

    // // Insert last to the form
    lastPiece.after(newPiece)
    // console.log(newField)
    // newField.firstElementChild.focus()

  }
  // removeField(e) {
  //   // Allows remove field on escape key
  //   if(e.type==='keyup' && e.key!=='Escape'){ return }

  //   e.preventDefault()
  //   if(this.answerFieldTargets.length>1){
  //     let lastFieldText = this.answerFieldTargets[this.answerFieldTargets.length - 2];
  //     e.target.closest('fieldset').remove()
  //     lastFieldText.firstElementChild.focus()
  //   }
  // }



}
