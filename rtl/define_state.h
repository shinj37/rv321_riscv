`ifndef DEFINE_STATE

// for top state - we have more states than needed
typedef enum logic [1:0] {
	R_format, 
	id, 
	sd, 
	beq
} top_control
