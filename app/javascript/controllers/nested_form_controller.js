import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
	static values = {
    partialUrl: String ,
		nestedFormId: String
  };

  async getNestedFormPartial () {
    const response = await get(this.partialUrlValue);

    if (response.ok) {
      const body = await response.html;
      const nestedForm = document.getElementById(this.nestedFormIdValue);
      const templateElement = document.createElement("template");
      templateElement.innerHTML = body;

      nestedForm.prepend(templateElement.content.firstElementChild);
    }
  }
}