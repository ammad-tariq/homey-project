pin "application", preload: true
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.0.4/lib/assets/compiled/rails-ujs.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
