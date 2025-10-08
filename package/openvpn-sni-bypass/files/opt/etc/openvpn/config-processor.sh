#!/bin/sh
# OpenVPN Config Processor for SNI Bypass v1.1
# TLS 1.0 - 1.3 Support

INPUT_CONFIG="$1"
OUTPUT_CONFIG="$2"
SNI_HOST="$3"

if [ ! -f "$INPUT_CONFIG" ]; then
    echo "Error: Config file not found: $INPUT_CONFIG"
    exit 1
fi

# Copy original config
cp "$INPUT_CONFIG" "$OUTPUT_CONFIG"

# Remove existing SNI bypass params if any
sed -i '/# SNI Bypass Configuration/,/# End SNI Bypass/d' "$OUTPUT_CONFIG"

# Add SNI bypass configuration with TLS 1.3 support
cat >> "$OUTPUT_CONFIG" << EOFSNI

# SNI Bypass Configuration v1.1
# SNI Host: $SNI_HOST
# TLS Support: 1.0, 1.1, 1.2, 1.3

# TLS configuration - support all versions up to 1.3
tls-version-min 1.0
tls-version-max 1.3

# Modern cipher suites (TLS 1.0 - 1.3 compatible)
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384:TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384:TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256:TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384:TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384:TLS-DHE-RSA-WITH-AES-256-GCM-SHA384:TLS-DHE-RSA-WITH-AES-256-CBC-SHA256:TLS-DHE-RSA-WITH-AES-128-GCM-SHA256

# TLS 1.3 cipher suites
tls-ciphersuites TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256

# Data channel encryption
cipher AES-256-GCM
data-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC
data-ciphers-fallback AES-256-CBC

# Authentication
auth SHA256

# Packet fragmentation for DPI bypass
fragment 1300
mssfix 1300

# Buffer optimization
sndbuf 393216
rcvbuf 393216
push-peer-info

# Connection optimization
persist-key
persist-tun
nobind
resolv-retry infinite

# Handshake window for better connectivity
hand-window 60
connect-retry-max 3
connect-retry 5

# Logging
verb 3
mute 20

# End SNI Bypass Configuration
EOFSNI

echo "Config processed with SNI bypass and TLS 1.3 support"