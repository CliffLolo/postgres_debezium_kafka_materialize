create table sales_sale (
	id INT PRIMARY KEY,
	patient_id VARCHAR(50),
	facility_id VARCHAR(50),
	user_id INT,
	status VARCHAR(50),
	create_date DATE,
	last_update DATE,
	currency VARCHAR(50),
	receipt_id VARCHAR(50),
	uuid VARCHAR(50),
	sale_date DATE,
	mpharma_id INT,
	referring_physcian_id INT,
	is_offline_synced VARCHAR(50),
	is_mutti VARCHAR(50),
	has_insurance_covered_items VARCHAR(50),
	insurance_coverage_amount DECIMAL(5,2),
	is_global_sale VARCHAR(50),
	patient_facility_id INT,
	is_phased_payment VARCHAR(50),
	total_vat_amount DECIMAL(5,2),
	created_by_id INT,
	is_mymutti VARCHAR(50),
	payment_source VARCHAR(50),
	canceled_date DATE,
	is_promo_sale VARCHAR(50),
	promo_code_amount DECIMAL(5,2),
	promo_code_uuid VARCHAR(50)
);
insert into sales_sale (id, patient_id, facility_id, user_id, status, create_date, last_update, currency, receipt_id, uuid, sale_date, mpharma_id, referring_physcian_id, is_offline_synced, is_mutti, has_insurance_covered_items, insurance_coverage_amount, is_global_sale, patient_facility_id, is_phased_payment, total_vat_amount, created_by_id, is_mymutti, payment_source, canceled_date, is_promo_sale, promo_code_amount, promo_code_uuid) values (1, 'Scarface', '7390053100', 591, 'XS', '2021/08/08', '2021/07/12', 'IDR', 'U32w-95562587', '1BYrSKuUAp9stzyKx9rZBUnCbpyGHC35Qb', '2021/12/20', 43707452, null, false, null, null, null, false, 627, true, 15.8, null, false, null, null, true, 63.3, null);
insert into sales_sale (id, patient_id, facility_id, user_id, status, create_date, last_update, currency, receipt_id, uuid, sale_date, mpharma_id, referring_physcian_id, is_offline_synced, is_mutti, has_insurance_covered_items, insurance_coverage_amount, is_global_sale, patient_facility_id, is_phased_payment, total_vat_amount, created_by_id, is_mymutti, payment_source, canceled_date, is_promo_sale, promo_code_amount, promo_code_uuid) values (2, 'Justine', '5751971493', 248, '2XL', '2022/03/17', '2021/12/27', 'CNY', '008I-06653900', '1MsgZhGchAgFtH3jbhkdHUrPVm9Gu3S5uA', '2021/09/19', 35764040, null, true, null, null, null, true, 555, true, 9.09, null, true, null, null, true, 38.49, null);
insert into sales_sale (id, patient_id, facility_id, user_id, status, create_date, last_update, currency, receipt_id, uuid, sale_date, mpharma_id, referring_physcian_id, is_offline_synced, is_mutti, has_insurance_covered_items, insurance_coverage_amount, is_global_sale, patient_facility_id, is_phased_payment, total_vat_amount, created_by_id, is_mymutti, payment_source, canceled_date, is_promo_sale, promo_code_amount, promo_code_uuid) values (3, 'Cyndia', '0385043953', 968, 'XL', '2021/07/31', '2021/11/18', 'SEK', 'b93T-13131663', '1AmXCFWYxvhk7SziuBjVQtGjiHhovnmX7q', '2022/02/25', 21786528, null, true, null, null, null, true, 771, false, 95.37, null, true, null, null, false, 69.11, null);
insert into sales_sale (id, patient_id, facility_id, user_id, status, create_date, last_update, currency, receipt_id, uuid, sale_date, mpharma_id, referring_physcian_id, is_offline_synced, is_mutti, has_insurance_covered_items, insurance_coverage_amount, is_global_sale, patient_facility_id, is_phased_payment, total_vat_amount, created_by_id, is_mymutti, payment_source, canceled_date, is_promo_sale, promo_code_amount, promo_code_uuid) values (4, 'Jephthah', '1201638097', 86, '2XL', '2022/02/07', '2022/03/28', 'EUR', 'c70N-26648393', '1M4S8eEFsZ6fcUp5KAe8WR5oK2Q5pNsvAB', '2021/06/18', 87363454, null, true, null, null, null, true, 415, false, 42.57, null, false, null, null, false, 76.82, null);
insert into sales_sale (id, patient_id, facility_id, user_id, status, create_date, last_update, currency, receipt_id, uuid, sale_date, mpharma_id, referring_physcian_id, is_offline_synced, is_mutti, has_insurance_covered_items, insurance_coverage_amount, is_global_sale, patient_facility_id, is_phased_payment, total_vat_amount, created_by_id, is_mymutti, payment_source, canceled_date, is_promo_sale, promo_code_amount, promo_code_uuid) values (5, 'Etienne', '7051693395', 556, 'M', '2021/06/02', '2021/10/14', 'RUB', 'Z52H-58404413', '1BjwcRre1uQbPw7Ncp7bxHpqkQwB9rzo5o', '2021/12/10', 76063343, 6, false, false, false, 12.04, false, 905, true, 16.03, null, false, null, null, false, 52.85, '1LSYuUuGKf4USj7omh6pA6AjCmMoqCAH8d');

create table sales_saleitem (
	id INT PRIMARY KEY,
	quantity INT,
	product_alias_id VARCHAR(50),
	unit_cost DECIMAL(10,2),
	sale_id INT REFERENCES sales_sale (id),
	create_date DATE,
	last_update DATE,
	is_manual VARCHAR(50),
	insurance_covered VARCHAR(50),
	is_off_formulary VARCHAR(50),
	vat_amount DECIMAL(10,2),
	mpharma_unit_cost_price DECIMAL(7,2),
	vmi_unit_cost_price DECIMAL(7,2),
	is_promo_sale VARCHAR(50),
	promo_code_amount DECIMAL(4,2),
	promo_code_uuid INT,
	insurance_cover DECIMAL(3,2)
);
insert into sales_saleitem (id, quantity, product_alias_id, unit_cost, sale_id, create_date, last_update, is_manual, insurance_covered, is_off_formulary, vat_amount, mpharma_unit_cost_price, vmi_unit_cost_price, is_promo_sale, promo_code_amount, promo_code_uuid, insurance_cover) values (1, 12829, '1Fr8ka3fpYEMKtdP1WRCiXFtQuPNJRoRC5', 6866974.0, 2, '2022/02/12', '2022/04/10', false, false, true, 44958.4, 42298.59, 15551.13, true, null, 11, 0.96);
insert into sales_saleitem (id, quantity, product_alias_id, unit_cost, sale_id, create_date, last_update, is_manual, insurance_covered, is_off_formulary, vat_amount, mpharma_unit_cost_price, vmi_unit_cost_price, is_promo_sale, promo_code_amount, promo_code_uuid, insurance_cover) values (2, 11295, '1ujg4hnuTDiNfgxjRmv7A4jekJgzdzin3', 2364628.02, 1, '2021/12/06', '2021/09/30', false, false, false, 38083.88, null, null, false, null, 72, 0.56);
insert into sales_saleitem (id, quantity, product_alias_id, unit_cost, sale_id, create_date, last_update, is_manual, insurance_covered, is_off_formulary, vat_amount, mpharma_unit_cost_price, vmi_unit_cost_price, is_promo_sale, promo_code_amount, promo_code_uuid, insurance_cover) values (3, 8279, '1NDc4L6MzZRUv6Fe6RVuAFFj1XMnCbMYiN', 6235188.59, 5, '2021/12/10', '2021/06/04', true, false, true, 14119.32, 4331.51, 17967.37, true, null, 74, 0.37);
insert into sales_saleitem (id, quantity, product_alias_id, unit_cost, sale_id, create_date, last_update, is_manual, insurance_covered, is_off_formulary, vat_amount, mpharma_unit_cost_price, vmi_unit_cost_price, is_promo_sale, promo_code_amount, promo_code_uuid, insurance_cover) values (4, 3383, '1PrcvE1YbeeBgRGyq6WNZCdFAQLGE4uYr8', 1547961.0, 4, '2022/01/13', '2022/03/08', false, false, false, 31153.63, 33407.41, 17986.46, true, null, 50, 0.73);
insert into sales_saleitem (id, quantity, product_alias_id, unit_cost, sale_id, create_date, last_update, is_manual, insurance_covered, is_off_formulary, vat_amount, mpharma_unit_cost_price, vmi_unit_cost_price, is_promo_sale, promo_code_amount, promo_code_uuid, insurance_cover) values (5, 12036, '186tWkXfoJ6xXv44w1uyMdNH2KXvGPncWg', 3806058.41, 3, '2021/07/30', '2021/07/13', true, false, false, 381.14, null, null, false, null, 29, 0.42);