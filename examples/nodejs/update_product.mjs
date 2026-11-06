// Change Alerts and Checks – Node.js example (Node 18+, ES module)
// Usage: ASIN_API_KEY=your-key node update_product.mjs

const headers = { Authorization: `Bearer ${process.env.ASIN_API_KEY}`, "Content-Type": "application/json" };

const response = await fetch("https://www.asin.dev/api/v1/products/8f0b3c7e-2a4d-4e51-9c1a-6d2f1b9e7a30", {
  method: "PATCH",
  headers,
  body: JSON.stringify({
  "target_price": 65,
  "interval_minutes": 360
}),
});
if (!response.ok) {
  console.error(`HTTP ${response.status}: ${await response.text()}`);
  process.exit(1);
}

console.log(JSON.stringify(await response.json(), null, 2));
