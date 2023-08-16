const clientId = 'a97c14ae10df40e490eb821e6590b88e';
const clientSecret = '285ee652b7be45c392cc9afa96ce1c1e'; // Replace with your client secret

const authString = `${clientId}:${clientSecret}`;
const base64Encoded = btoa(authString);

console.log(base64Encoded);