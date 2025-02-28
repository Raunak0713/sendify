import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  webpack: (config, { isServer }) => {
    // If it's the server build, ignore the client-side specific modules
    if (!isServer) {
      config.resolve.fallback = {
        net: false,
        tls: false,
        fs: false,
        child_process: false,
        dns: false,
        stream: false,
        crypto: false,
        http: false,
        https: false,
        http2: false,
        os: false,
        path: false,
        zlib: false,
      };
    }

    return config;
  },
};

export default nextConfig;