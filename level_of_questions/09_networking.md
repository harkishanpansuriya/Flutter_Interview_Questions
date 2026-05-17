## What is IPv4?

- **IPv4 (Internet Protocol version 4):**
    - Fourth version of the Internet Protocol (IP).
    - Uses a 32-bit address scheme, typically represented in dotted decimal format (e.g.,
      192.168.1.1).
    - Widely used to identify devices on a network and route data packets across the Internet.

## MQTT (Message Queuing Telemetry Transport)

- **MQTT:**
    - A lightweight messaging protocol for small sensors and mobile devices.
    - Uses a publish/subscribe architecture.
    - Efficiently sends messages over low-bandwidth networks, making it ideal for IoT (Internet of
      Things) applications.

## Channel Socket in Flutter

- **Definition:** Communication channel facilitating real-time data exchange between Flutter
  applications or between Flutter and native platform components.
- **Types:**
    - **Method Channels:** Synchronous communication channels for invoking methods between Flutter
      and native platform.
    - **Stream Channels:** Asynchronous communication channels for streaming data between Flutter
      and native platform.

## `freezed` vs `json_serializable` in Flutter

- In Flutter, both freezed and json_serializable are used to reduce boilerplate code when working
  with models and APIs, but they solve different problems.

* **freezed**:

    * Used to create **immutable models**
    * Generates **copyWith, equality, and boilerplate code**
    * Helps with **state management & data modeling**

* **json_serializable**:

    * Used for **JSON parsing**
    * Generates `fromJson` and `toJson` methods
    * Converts **JSON ↔ Dart objects**

### Key Difference

“freezed is for creating models, while json_serializable is for converting JSON data.”

in short, “freezed handles model generation, and json_serializable handles JSON serialization.”

## MQTT vs WebSockets in Flutter

MQTT and WebSockets are both used for real-time communication, but they serve different purposes.

* **MQTT** is a lightweight protocol mainly used for **IoT devices** (sensors, smart homes, low
  bandwidth systems).
  It follows a **publish–subscribe model using a broker**.

    * *Example:* A temperature sensor publishes data → mobile app subscribes → receives live
      updates.
    * Package: mqtt_client

* **WebSockets** are used for **real-time applications** like chat, notifications, and live
  tracking.
  It provides a **direct two-way connection** between client and server.

    * *Example:* In a chat app, messages are delivered instantly without refreshing.
    * Package: web_socket_channel

In short, “MQTT is used for IoT-based publish–subscribe communication via a broker, while WebSockets
provide direct real-time communication between client and server, commonly used in chat and live
apps.”


## GraphQL vs REST

🔹 **GraphQL** → Flexible API that allows clients to request specific data from a single endpoint.  
✅ Efficient data fetching  
✅ Scalable & flexible  
❌ Requires learning & setup

🔹 **REST** → Uses multiple fixed endpoints (GET, POST, etc.) to serve data.  
✅ Simple & widely used  
✅ Easy to cache  
❌ Can over-fetch or under-fetch data

**Key Difference:** GraphQL gives **exact data** as requested, while REST may return **fixed,
predefined data** from multiple endpoints.

## What is MQTT, and why is it used in IoT?

- **MQTT (Message Queuing Telemetry Transport):**  
  A lightweight **publish-subscribe messaging protocol**

- **Why used in IoT:**
    - Designed for **low-bandwidth, high-latency, and unreliable networks**
    - Enables **efficient communication** between IoT devices and cloud services
    - **Minimal power consumption**, ideal for battery-powered devices

## What is the difference between MQTT and HTTP in AWS IoT?

- MQTT: Lightweight, publish/subscribe protocol designed for real-time messaging. Maintains a
  persistent connection, supports bidirectional communication. Efficient for devices with limited
  bandwidth or battery. HTTP: Request/response protocol, stateless. Each message requires a new
  connection. Less efficient for frequent or real-time updates. Key Difference: MQTT is ideal for
  real-time, low-latency IoT communication, while HTTP is better for occasional, request-driven data
  exchange.

## What are the limitations of AWS IoT Core with MQTT?

- Message size limit: Maximum payload size is 128 KB.
  Limited topic depth: AWS IoT allows up to 7-level topic hierarchy.
  Connection limits: Each account has a quota on concurrent connections.
  Cost considerations: Frequent high-volume messaging can lead to increased costs.
  No retained messages: AWS IoT Core does not support MQTT retained messages.

## Convert a JSON string to a Dart model.

- To convert a JSON string to a Dart model, you first create a model class with a fromJson factory
  constructor, then use jsonDecode from dart:convert.

