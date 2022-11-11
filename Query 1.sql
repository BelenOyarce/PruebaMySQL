CREATE SCHEMA IF NOT EXISTS minimarket_schema;

CREATE TABLE `minimarket_schema`. `producto`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombre`VARCHAR(30) NOT NULL,
`stock`INT NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`producto_id`));

CREATE TABLE `minimarket_schema`. `tipoProducto`(
`tipoProducto_id`INT NOT NULL AUTO_INCREMENT,
`categoria` VARCHAR(45) NOT NULL,
PRIMARY KEY (`tipoProducto_id`)); 

CREATE TABLE `minimarket_schema`.`cliente`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(30) NOT NULL,
PRIMARY KEY (`cliente_id`));

CREATE TABLE `minimarket_schema`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(30) NOT NULL,
`direccion` VARCHAR(100) NOT NULL,
`telefono` INT NOT NULL,
PRIMARY KEY (`proveedor_id`));

CREATE TABLE `minimarket_schema`.`boleta`(
`boleta_id` INT NOT NULL AUTO_INCREMENT,
`fecha` DATE NOT NULL,
PRIMARY KEY (`boleta_id`));

CREATE TABLE `minimarket_schema`.`detalleCliente`(
`detalle_id`INT NOT NULL AUTO_INCREMENT,
`cantidad` INT NOT NULL,
`unidadMedida`VARCHAR(10) NOT NULL,
`precio`INT NOT NULL,
PRIMARY KEY (`detalle_id`)); 

CREATE TABLE `minimarket_schema`.`detalleProveedor`(
`detalleProveedor_id`INT NOT NULL AUTO_INCREMENT,
`fecha` DATE NOT NULL,
`tipoproducto` VARCHAR(30) NOT NULL,
`cantidad` INT NOT NULL,
`unidadMedida` VARCHAR(10) NOT NULL,
`precioProveedor`INT NOT NULL,
PRIMARY KEY (`detalleProveedor_id`));

CREATE TABLE `minimarket_schema`.`historialOrden`(
`historial_id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`historial_id`));

ALTER TABLE minimarket_schema.producto ADD tipoProducto_id INT NOT NULL;
ALTER TABLE minimarket_schema.producto ADD CONSTRAINT tipoProductoProducto FOREIGN KEY (tipoProducto_id) REFERENCES minimarket_schema.producto(tipoProducto_id);

ALTER TABLE minimarket_schema.producto ADD proveedor_id INT NOT NULL;
ALTER TABLE minimarket_schema.producto ADD CONSTRAINT proveedorProducto FOREIGN KEY (proveedor_id) REFERENCES minimarket_schema.producto(proveedor_id);

ALTER TABLE minimarket_schema.venta ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_schema.venta ADD CONSTRAINT productoVenta FOREIGN KEY (producto_id) REFERENCES minimarket_schema.venta(producto_id);

ALTER TABLE minimarket_schema.historialorden ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_schema.historialorden ADD CONSTRAINT productoHistorial FOREIGN KEY (producto_id) REFERENCES minimarket_schema.historialorden(producto_id);

ALTER TABLE minimarket_schema.historialorden ADD proveedor_id INT NOT NULL;
ALTER TABLE minimarket_schema.historialorden ADD CONSTRAINT proveedorHistorial FOREIGN KEY (proveedor_id) REFERENCES minimarket_schema.historialorden(proveedor_id);

ALTER TABLE minimarket_schema.historialorden ADD detalleProveedor_id INT NOT NULL;
ALTER TABLE minimarket_schema.historialorden ADD CONSTRAINT detalleproveedorHistorial FOREIGN KEY (detalleProveedor_id) REFERENCES minimarket_schema.historialorden(detalleProveedor_id);

ALTER TABLE minimarket_schema.historialorden ADD tipoProducto_id INT NOT NULL;
ALTER TABLE minimarket_schema.historialorden ADD CONSTRAINT tipoProductoHistorial FOREIGN KEY (tipoProducto_id) REFERENCES minimarket_schema.historialorden(tipoProducto_id);

ALTER TABLE minimarket_schema.proveedor ADD tipoProducto_id INT NOT NULL;
ALTER TABLE minimarket_schema.proveedor ADD CONSTRAINT tipoProductoHistorial FOREIGN KEY (tipoProducto_id) REFERENCES minimarket_schema.proveedor(tipoProducto_id);

ALTER TABLE minimarket_schema.boleta ADD cliente_id INT NOT NULL;
ALTER TABLE minimarket_schema.boleta ADD CONSTRAINT clienteBoleta FOREIGN KEY (cliente_id) REFERENCES minimarket_schema.boleta(cliente_id);

ALTER TABLE minimarket_schema.detalle ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_schema.detalle ADD CONSTRAINT productoDetalle FOREIGN KEY (producto_id) REFERENCES minimarket_schema.detalle(producto_id);

ALTER TABLE minimarket_schema.detalle ADD boleta_id INT NOT NULL;
ALTER TABLE minimarket_schema.detalle ADD CONSTRAINT boletaDetalle FOREIGN KEY (boleta_id) REFERENCES minimarket_schema.detalle(boleta_id);

ALTER TABLE minimarket_schema.detalleProveedor ADD proveedor_id INT NOT NULL;
ALTER TABLE minimarket_schema.detalleProveedor ADD CONSTRAINT proveedorDetalle FOREIGN KEY (proveedor_id) REFERENCES minimarket_schema.detalleProveedor(proveedor_id);


