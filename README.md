This repository contains a pipelined **Image Processing Architecture** written in **SystemVerilog**, implementing essential image enhancement and manipulation blocks. The design includes **Smoothening**, **Sharpening**, **Blending**, and **Normalization**, along with grayscale image conversion and BRAM-based storage integration.

---

## 📂 Directory Structure
<pre> 📁 image-processing-architecture/ ├── 📁 srcs/ │ └── 📁 sources_1/ │ └── 📁 new/ │ ├── grayscale_converter.sv │ ├── smoothening_block.sv │ ├── sharpening_block.sv │ ├── blending_block.sv │ ├── normalization_block.sv │ ├── bram_module.sv │ └── top_module.sv └── README.md </pre>

## 🧠 Architecture Overview

- ✅ **Grayscale Conversion**  
  Converts input images to grayscale as a preprocessing step.

- ✅ **Pipelined Processing Blocks**  
  The architecture includes the following pipelined processing modules:
  - **Smoothening Block**
  - **Sharpening Block**
  - **Blending Block**
  - **Normalization Block**

- ✅ **BRAM Integration**  
  The grayscale image is stored in a **Block RAM (BRAM)** module, which interfaces directly with the **Top Module**.

- ✅ **Fully Pipelined Design**  
  Optimized for performance and throughput, each block supports pipelined execution for real-time or high-speed processing.
