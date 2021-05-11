help:
	@echo "build - build a package"
	@echo "clean - remove gnerated build artifacts"

# ===============================
# VARIABLES
# ===============================

# directory where to output build artifacts
BUILD_DIR = build

# ===============================
# COMMANDS
# ===============================

build:
	@echo "starting build..."
	# ensure build putput directory exists 
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR) 	
	# run build steps (just testing so far)
	pandoc lectures/hello-world/index.md -f markdown -t html -s -o $(BUILD_DIR)/test.html

clean:
	@echo "cleaning build artifacts..."
	rm -fr $(BUILD_DIR)

all: build