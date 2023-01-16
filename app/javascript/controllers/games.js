import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  set_my_player_name(e) {
    console.log(`todo: set my name to '${e.currentTarget.value}'`)
  }

  ready(e) {
    console.log("todo: set me to ready, update the player-setup-me element")
  }

  not_ready(e) {
    console.log("todo: set me to not ready, update the player-setup-me element")
  }
}
