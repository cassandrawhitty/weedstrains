console.log("hi");

fetch("http://localhost:3000/joiners")
  .then((response) => response.json())
  .then(console.log);
