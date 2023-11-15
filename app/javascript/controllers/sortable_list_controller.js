import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      handle: "[data-sortable-list-handle]",
      onUpdate: async (e) => {
        const response = await patch(e.item.dataset.sortableListEndpoint, {
          body: JSON.stringify({
            new_index: e.newIndex,
          }),
          responseKind: "turbo-stream",
        })

        if (response.ok) {
          this.element.dataset.testid = "successfully updated"
        }
      },
    })
  }
}
