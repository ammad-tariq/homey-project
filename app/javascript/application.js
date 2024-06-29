import Rails from "@rails/ujs"
import { Turbo } from "@hotwired/turbo-rails"

Rails.start()
Turbo.start()

import "controllers"
