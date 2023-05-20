module.exports = {
  content: [
    "./app/assets/stylesheets/**/*.css",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.html.erb",
  ],
  plugins: [require("@tailwindcss/forms")],
}
