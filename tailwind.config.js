module.exports = {
  content: [
    "./app/assets/stylesheets/**/*.css",
    "./app/components/**/*.{html.erb,rb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{html,html.erb}",
  ],
  plugins: [require("@tailwindcss/forms")],
}
