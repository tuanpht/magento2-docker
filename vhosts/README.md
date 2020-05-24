Using [`mkcert`](https://github.com/FiloSottile/mkcert) to generage valid SSL certificate for localhost:
```bash
╭─ ubuntu ~/Projects/magento-ee  ‹master*› 
╰─ $ mkcert -install
Using the local CA at "/home/ubuntu/.local/share/mkcert" ✨

╭─ ubuntu ~/Projects/magento-ee  ‹master*› 
╰─ $ mkcert magento2.test
Using the local CA at "/home/ubuntu/.local/share/mkcert" ✨

Created a new certificate valid for the following names 📜
 - "magento2.test"

The certificate is at "./magento2.test.pem" and the key at "./magento2.test-key.pem" ✅
```
Generated files: `magento2.test-key.pem` và `magento2.test.pem` are ready for using in Apache or Nginx.
