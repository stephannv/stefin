import { Controller } from '@hotwired/stimulus'

import SimpleMaskMoney from 'simple-mask-money'

// Connects to data-controller="money-field"
export default class extends Controller {
  connect () {
    this.setupInput()
    this.setupUnmaskOnSubmit()
  }

  setupInput () {
    SimpleMaskMoney.setMask(this.element, { allowNegative: false, fixed: true, cursor: 'end' })
  }

  setupUnmaskOnSubmit () {
    this.element.form.addEventListener('submit', () => {
      const maskedValue = this.element.value
      this.element.value = maskedValue.replace(/\D/g, '') // keep numeric characters
      setTimeout(() => { this.element.value = maskedValue }, 1) // set masked value again after submit
    })
  }
}
