// List Tracked Products – Node.js example (Node 18+, ES module)
// Usage: ASIN_API_KEY=your-key node list_products.mjs

const headers = { Authorization: `Bearer ${process.env.ASIN_API_KEY}`, "Content-Type": "application/json" };

const params = new URLSearchParams({
  "filter": "drops",
  "limit": "20",
});
const response = await fetch(`https://www.asin.dev/api/v1/products?${params}`, { headers });
if (!response.ok) {
  console.error(`HTTP ${response.status}: ${await response.text()}`);
  process.exit(1);
}

console.log(JSON.stringify(await response.json(), null, 2));
