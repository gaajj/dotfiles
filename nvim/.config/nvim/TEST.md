# Feague

> A minimal, powerful Minecraft client for version 26.1.2

---

## Overview

Feague is a Minecraft client built around a single principle: give the user full control without unnecessary overhead. Every feature is optional, every setting is exposed, and the underlying architecture is designed to be clean, modular, and version-portable. Users who want a stripped-down, highly optimized experience can disable everything and run a lean vanilla-equivalent. Users who want a fully featured client can enable exactly what they need.

---

## Design Philosophy

| Principle | Description |
|---|---|
| **Minimal** | No feature is on by default that the user cannot fully disable. |
| **Powerful** | Every enabled feature is fully configurable and exposes its internals through settings. |
| **Modular** | The client is composed of discrete, independent modules. Modules do not bleed into each other. |
| **Portable** | The base layer is decoupled from any specific Minecraft version, making upgrades clean and straightforward. |
| **Secure** | The user system is a first-class concern, not an afterthought. |

---

## Architecture

Feague is split into two distinct layers: the **Base** and the **Client**. This separation keeps the codebase clean and ensures that core infrastructure is never entangled with gameplay-level features.

### The Base

The Base is an independent module that acts as the foundation of the entire project. It contains:

- **User System** — Authentication, identity management, and session handling. Shared across the client.
- **Settings Framework** — The canonical system for defining, storing, and resolving settings. Both shared and module-level settings are managed here.
- **Module Registry** — The mechanism by which modules are registered, discovered, categorized, and toggled.
- **Default Logic** — Base-level behavior that all modules inherit or can opt into.

The Base has no dependency on client-side gameplay code. This means it can be updated, tested, and ported independently. When a new Minecraft version is targeted, the Base requires no changes — only the Client layer is ported.

### The Client

The Client is built on top of the Base. It is responsible for:

- Implementing gameplay-facing modules (e.g., rendering, HUD, utilities).
- Consuming the Base's user system, settings framework, and module registry.
- Interfacing with Minecraft's internals (mixins, events, hooks).

The Client has a hard dependency on the Base, but the Base has no dependency on the Client.

```
┌─────────────────────────────┐
│           Client            │  ← Minecraft-version-specific
│  (Modules, Mixins, HUD...)  │
├─────────────────────────────┤
│            Base             │  ← Version-agnostic
│  (Users, Settings, Registry)│
└─────────────────────────────┘
```

### Portability

The Base/Client split directly enables clean version upgrades. When a new Minecraft version is released:

1. The Base remains unchanged.
2. The Client is ported — updated mixins, event hooks, and API changes only.
3. All user data, settings, and module configurations are preserved through the Base.

The cost of a version upgrade is bounded to the Client layer and never compounds into core infrastructure.

---

## Module System

All client features are implemented as **modules**. A module is a self-contained unit of functionality that can be independently enabled or disabled.

### Structure

- **Category** — Every module belongs to exactly one category (e.g., `Render`, `Combat`, `Utility`, `HUD`).
- **Toggle** — Every module can be enabled or disabled at runtime. Disabling all modules leaves the user with an optimized, vanilla-equivalent experience.
- **Settings** — Modules expose settings that control their behavior.

### Settings

| Type | Description |
|---|---|
| **Shared settings** | Defined in the Base. Common across all modules (e.g., keybind, enabled state). |
| **Module settings** | Defined per-module. Specific to that module's behavior (e.g., color, radius, threshold). |

Settings are persistent, strongly typed, and always exposed to the user. There are no hidden or hardcoded values.

### Categories

Modules are organized into the following categories. Each category groups modules by their area of concern.

| Category | Description | Example Modules |
|---|---|---|
| **Render** | Visual modifications to the game world and entities. | Fullbright, No Weather, Entity ESP, Tracers, Custom Sky |
| **HUD** | On-screen overlays and information displays. | Coordinates, FPS Counter, Armor Status, Potion Effects, Ping |
| **Utility** | Quality-of-life and automation helpers. | Auto Sprint, Fast Place, No Rotate, Middle Click Friends |
| **Movement** | Modifications to player movement behavior. | Step, No Fall, Speed, Sneak Control |
| **Combat** | Combat-focused tools and feedback. | Reach Display, Hit Indicator, Anti-Blindness, Attack Notify |
| **World** | Interaction with and information about the game world. | Search, Path Highlighter, Crop Notifier, Container Preview |

> Categories are fixed at the Base level. New modules can be added to any category without modifying the category definition.

---

## GUI & Interaction

Feague exposes its functionality through two interaction layers. Both operate on the same underlying module and settings system.

### Commands

Commands are the primary interaction method and the first to be implemented. They provide full control over the client from the chat input without requiring any visual interface.

- **Prefix** — All commands use a dedicated prefix (e.g., `.`).
- **Scope** — Commands can toggle modules, change settings, query state, and manage the user session.
- **Design** — Commands are self-documenting. A help command lists all available commands and their arguments.

Example usage:
```
.toggle fullbright
.set fullbright brightness 1.5
.modules render
.help
```

### ClickGUI

The ClickGUI is a visual module manager rendered in-game. It is planned for a later phase, after the command layer and core module system are stable.

- Displays all modules organized by category.
- Allows toggling modules and editing their settings via mouse interaction.
- Opened and closed via a configurable keybind.

### Keybinds

Every module exposes a keybind setting (defined at the Base level as a shared setting). When bound, the keybind toggles the module independently of the GUI or command interface.

### Rollout

| Phase | Available |
|---|---|
| Starting phase | Commands, Keybinds |
| Later phase | ClickGUI |

---

## Configuration & Persistence

All client state is persisted as JSON under the Feague config directory.

### Location

```
.minecraft/feague/
├── feague.json          ← active config
├── configs/             ← saved local configs
│   ├── pvp.json
│   ├── building.json
│   └── ...
└── user.json
```

- `feague.json` — the currently active config. Loaded on startup, written on change.
- `configs/` — a local library of saved configs. Any file here can be loaded as the active config via command or ClickGUI.
- `user.json` — user session and identity data.

### Config Structure

All config files (active and saved) follow the same schema:

```json
{
  "schema": 1,
  "client": {
    "commandPrefix": ".",
    "guiKeybind": "RSHIFT"
  },
  "modules": {
    "fullbright": {
      "enabled": true,
      "keybind": "R",
      "settings": {
        "brightness": 1.5
      }
    },
    "coordinates": {
      "enabled": false,
      "keybind": null,
      "settings": {}
    }
  }
}
```

### Sharing

Config files are portable and self-contained. Sharing a config means sharing a single JSON file.

**Local**
- Drop any valid config file into `configs/` to make it available.
- Load it via `.config load <name>` or through the ClickGUI.

**User-linked** *(planned)*

The user system powers a layered sharing ecosystem:

| Layer | Description |
|---|---|
| **Library** | A personal collection of saved configs tied to the user's account. Synced across devices. |
| **Friends** | Direct config sharing with friends in the user's network. |
| **Market** | A public marketplace where users can publish, browse, and import community configs. |

Configs received from any user-linked source land in `configs/` and are applied the same way as local ones.

### Schema Versioning

The top-level `schema` field is an integer version. When Feague loads a config with an outdated version, a migration path is applied before writing it back.

---

## Event System

The event system is the backbone of module communication with the game. It is defined in the Base as a platform-agnostic abstraction. The Client layer maps Fabric-specific events onto Base events, so modules never depend on Fabric APIs directly.

### Architecture

```
Fabric Event
    ↓
Client Event Mapper
    ↓
Base EventBus  →  Module listeners
```

This keeps modules fully decoupled from the underlying platform. When porting to a new Minecraft version, only the Client-side event mappings need updating — module event handling code is untouched.

### Subscription Model

Modules subscribe to events using the `@EventHandler` annotation. Any method in a module annotated with `@EventHandler` and typed to a specific event class is automatically registered when the module is enabled and unregistered when it is disabled.

```java
@EventHandler
public void onTick(TickEvent event) {
    // called every game tick while the module is enabled
}

@EventHandler
public void onRender(RenderEvent event) {
    // called on render while the module is enabled
}
```

- **Auto-registration** — listeners are registered/unregistered with the module's toggle state. A disabled module receives no events.
- **No manual wiring** — modules do not call `register()` or `unsubscribe()` manually.

### Event Priorities

Events carry a priority level that controls dispatch order across listeners. Priorities are defined in the Base and used consistently across all event types.

| Priority | Use case |
|---|---|
| `HIGHEST` | Cancellation or interception before any processing. |
| `HIGH` | Early processing with awareness of other listeners. |
| `NORMAL` | Default for most module listeners. |
| `LOW` | Post-processing, cleanup, or dependent logic. |
| `LOWEST` | Final listeners; runs after all others. |

### Cancellable Events

Some events are cancellable. A module can call `event.cancel()` to prevent the event from propagating further and suppress the associated game behavior. Only events explicitly marked as cancellable support this.

```java
@EventHandler
public void onPacketReceive(PacketReceiveEvent event) {
    if (shouldBlock(event.getPacket())) {
        event.cancel();
    }
}
```

### Core Event Types

A non-exhaustive list of events defined in the Base:

| Event | Description |
|---|---|
| `TickEvent` | Fired every game tick. |
| `RenderEvent` | Fired during the render pass. |
| `PacketReceiveEvent` | Fired when a packet is received from the server. |
| `PacketSendEvent` | Fired when a packet is about to be sent to the server. |
| `PlayerMoveEvent` | Fired when the player moves. |
| `WorldLoadEvent` | Fired when a world or server is joined. |
| `WorldUnloadEvent` | Fired when a world or server is left. |

---

## User System

The user system lives entirely within the Base and is designed to be secure by default. It is the identity layer for the entire client — powering authentication, config sync, and the social sharing ecosystem.

### Authentication

- Credentials are never stored in plaintext. Tokens are used for session persistence.
- Login and registration are handled through a dedicated flow, not embedded in gameplay.
- The Base exposes a clean auth API; the Client never handles raw credentials.

### Session Management

Sessions have explicit lifecycle boundaries:

| State | Description |
|---|---|
| **Created** | User authenticated, token issued. |
| **Active** | Token valid, user actions permitted. |
| **Expired** | Token TTL elapsed, re-authentication required. |
| **Revoked** | Session explicitly invalidated (logout or security event). |

### Roles & Permissions *(planned)*

The user system will support basic roles to gate access to platform features (e.g., Market publishing, beta modules). Roles are enforced server-side; the client treats them as read-only metadata.

### Platform Integration

The user system is the backbone for all user-linked features:

- **Config Library** — configs are tied to a user account and synced across devices.
- **Friends** — the friends list is managed through the user system.
- **Market** — publishing and ownership are tied to a verified user identity.

---

## Roadmap

A high-level overview of development phases. No time constraints — phases are sequential and each builds on the last.

### Phase 1 — Foundation
> Establish the Base and a working client skeleton.

- Project structure and build setup (Base + Client as separate modules)
- Base: module registry, settings framework, event bus
- Base: user system (authentication, session management)
- Client: Fabric event mappings onto Base events
- Client: command system with core commands (`.toggle`, `.set`, `.help`)
- Client: keybind system
- Client: config persistence (`feague.json`)

### Phase 2 — First Modules
> Prove the architecture with a working set of modules.

- Implement initial modules across core categories (Render, HUD, Utility)
- Validate settings, keybinds, and toggle behavior end-to-end
- Config save/load working correctly

### Phase 3 — Expansion
> Fill out the module set and improve the user experience.

- Additional modules across all categories (Movement, Combat, World)
- ClickGUI implementation
- Local config profiles (`configs/` folder, `.config` commands)

### Phase 4 — Platform & Social
> Build the user-linked sharing ecosystem.

- User Library (cloud-synced personal configs)
- Friends (direct config sharing)
- Market (public config discovery and publishing)

---

## Target

| Field | Value |
|---|---|
| Minecraft Version | 26.1.2 |
| Loader | Fabric |
| Language | Java |

