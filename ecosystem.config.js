module.exports = {
  apps: [
    {
      name: "sspfs47130",
      cwd: "./sspfs47130",
      script: "./app.bundle.js",
      exec_mode: "cluster",
      instances: 3,
      watch: false,
      max_memory_restart: "1G",
      combine_logs: true,
      error_file: "./logs/pm2-error.log",
      out_file: "/dev/null",
      time: true,
      wait_ready: false,
      autorestart: true,
      env: {
        NODE_ENV: "production",
      },
    },
  ],
};
