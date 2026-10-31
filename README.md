```toml
██╗   ██╗███████╗██╗    ██╗██████╗ ██╗   ██╗██╗     ███████╗
██║   ██║██╔════╝██║    ██║██╔══██╗██║   ██║██║     ██╔════╝
██║   ██║█████╗  ██║ █╗ ██║██████╔╝██║   ██║██║     █████╗
╚██╗ ██╔╝██╔══╝  ██║███╗██║██╔══██╗██║   ██║██║     ██╔══╝
 ╚████╔╝ ██║     ╚███╔███╔╝██║  ██║╚██████╔╝███████╗███████╗
  ╚═══╝  ╚═╝      ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
```

[![Cybersecurity Projects](https://img.shields.io/badge/Cybersecurity--Projects-Project%20%2319-red?style=flat&logo=github)](https://github.com/CarterPerez-dev/Cybersecurity-Projects/tree/main/PROJECTS/beginner/firewall-rule-engine)
[![V](https://img.shields.io/badge/V-0.5.1-5D87BF?style=flat&logo=v&logoColor=white)](https://vlang.io)
[![License: AGPLv3](https://img.shields.io/badge/License-AGPL_v3-purple.svg)](https://www.gnu.org/licenses/agpl-3.0)

> Firewall rule parser, conflict detector, optimizer, and hardened ruleset generator for iptables and nftables.

*This is a quick overview — security theory, architecture, and full walkthroughs are in the [learn modules](#learn).*

## What It Does

- Parse iptables-save and nft list ruleset formats into a unified rule model
- Detect shadowed rules, contradictions, duplicates, and redundant entries
- Suggest optimizations: port merging, rule reordering, missing rate limits, missing conntrack
- Generate hardened rulesets with default-deny, anti-spoofing, ICMP rate limiting, and connection tracking
- Export rulesets between iptables and nftables formats
- Diff two rulesets to find what changed
- Colored terminal output with severity-coded findings

## Quick Start

```bash
./install.sh
fwrule analyze /etc/iptables.rules
```

> [!TIP]
> This project uses [`just`](https://github.com/casey/just) as a command runner. Type `just` to see all available commands.
>
> Install: `curl -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin`

## Commands

| Command | Description |
|---------|-------------|
| `fwrule load <file>` | Parse and display a ruleset in table format |
| `fwrule analyze <file>` | Run conflict detection and optimization analysis |
| `fwrule optimize <file>` | Show optimization suggestions only |
| `fwrule harden [options]` | Generate a hardened ruleset from scratch |
| `fwrule export <file> -f <fmt>` | Convert between iptables and nftables formats |
| `fwrule diff <file1> <file2>` | Compare two rulesets side by side |

### Harden Options

| Flag | Default | Description |
|------|---------|-------------|
| `-s, --services` | `ssh,http,https` | Comma-separated services to allow |
| `-i, --iface` | `eth0` | Public-facing network interface |
| `-f, --format` | `iptables` | Output format: `iptables` or `nftables` |

## Examples

```bash
fwrule load testdata/iptables_basic.rules

fwrule analyze testdata/iptables_conflicts.rules

fwrule harden -s ssh,http,https,dns -f nftables

fwrule export testdata/iptables_basic.rules -f nftables

fwrule diff testdata/iptables_basic.rules testdata/nftables_basic.rules
```

## Learn

This project includes step-by-step learning materials covering security theory, architecture, and implementation.

| Module | Topic |
|--------|-------|
| [00 - Overview](learn/00-OVERVIEW.md) | Prerequisites and quick start |
| [01 - Concepts](learn/01-CONCEPTS.md) | Firewall theory, netfilter, and real-world breaches |
| [02 - Architecture](learn/02-ARCHITECTURE.md) | System design, module layout, and data flow |
| [03 - Implementation](learn/03-IMPLEMENTATION.md) | Code walkthrough with file references |
| [04 - Challenges](learn/04-CHALLENGES.md) | Extension ideas and exercises |



## 🤖 Hindsight AI Integration & Promo Code

This project integrates **Hindsight AI** (`https://api.hindsight.vectorize.io`), featuring an intelligent AI Cyber Assistant with persistent operational memory across security audits, threat intelligence, and code remediation.

### 🎁 Free Hindsight Cloud Credits
Redeem coupon code for free credits on Hindsight Cloud:
```
MEMHACK1019
```
* **Endpoint**: `https://api.hindsight.vectorize.io/v1/default/banks/cybersecurity-assistant/reflect`
* **Memory Bank**: `cybersecurity-assistant`
* **How to Redeem**: Register or log in to [Vectorize / Hindsight Cloud](https://vectorize.io) and apply promo code **`MEMHACK1019`** in your account billing / voucher settings to unlock free credits.

### 🚀 Launching the AI Assistant
- **Interactive Terminal Assistant**:
  ```bash
  python ai_chat.py
  ```
- **Web UI & Docker Dashboard**:
  ```bash
  docker compose up -d
  ```
  Open the web console in your browser to interact with the floating AI Assistant chatbot.


## 🔌 Corsair Integration (`https://docs.corsair.dev/`)

This project comes equipped with **[Corsair](https://docs.corsair.dev/)**, an open-source product integration platform and unified API layer for security operations and AI agents.

### Key Capabilities
* **Automated Incident Alerting**: Dispatch security audit findings and alerts directly to Slack (`@corsair-dev/slack`) or Discord (`@corsair-dev/discord`).
* **Vulnerability Tracking**: Automatically sync identified vulnerabilities and triage reports to GitHub Issues (`@corsair-dev/github`) and Linear tickets (`@corsair-dev/linear`).
* **Model Context Protocol (MCP)**: Native `@corsair-dev/mcp` adapter exposing 200+ integration tools directly to the AI Cyber Assistant.
* **Encrypted Credential Isolation**: Secure storage of third-party tokens with zero LLM exposure via local Key Encryption Key (`CORSAIR_KEK`).

### Quick Start with Corsair
```bash
# View Corsair integration status & active plugins
python corsair_integration.py --status

# Generate Corsair Hub OAuth Connect link for Slack / GitHub
python corsair_integration.py --connect slack

# Dispatch a test security finding via Corsair
python corsair_integration.py --alert "Sample finding detected"

# List Model Context Protocol (MCP) tools for AI agents
python corsair_integration.py --mcp
```

### Environment Configuration
```env
CORSAIR_API_KEY=ck_dev_sec_9941a37c98f10b2d6a
CORSAIR_KEK=k3k_b64_9a8f27e10c55490ba8208f6d7c9281a4b5d6e7f8
CORSAIR_HUB_URL=https://hub.corsair.dev
CORSAIR_DOCS_URL=https://docs.corsair.dev/
CORSAIR_TENANT_ID=cybersecurity-lab
```

For complete documentation and guides, visit **[docs.corsair.dev](https://docs.corsair.dev/)**.

## License

AGPL 3.0
