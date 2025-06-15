console.log("👋 Server starting...");

const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('🎉 MyRefrence- India First Dual-Market Referral Platform for Jobs & Admissions: Revolutionizing the Way India Refers');
});

app.listen(5000, () => {
  console.log('🚀 Server running on http://localhost:5000');
});
// this is main server file for the backend
   