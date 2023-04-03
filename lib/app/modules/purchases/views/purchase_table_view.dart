import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_erp/app/modules/purchases/controllers/purchase_table_controller.dart';
import 'package:flutter_erp/app/modules/subscriptions/controllers/subscription_table_controller.dart';
import 'package:flutter_erp/app/modules/subscriptions/views/subscription_form_view.dart';
import 'package:flutter_erp/widgets/global_widgets/erp_search_field.dart';

import 'package:get/get.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseTableView extends GetResponsiveView<PurchaseTableController> {
  PurchaseTableView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: screen.context.theme.colorScheme.surfaceVariant,
      body: Card(
        margin: screen.isPhone
            ? EdgeInsets.zero
            : const EdgeInsets.only(right: 16, left: 16, top: 22, bottom: 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView(
            children: [
              if (!screen.isPhone) getHeader(controller),
              Obx(
                () => AdvancedPaginatedDataTable(
                  addEmptyRows: false,
                  source: controller.source,
                  showFirstLastButtons: true,
                  showHorizontalScrollbarAlways: !screen.isPhone,
                  rowsPerPage: controller.rowsPerPage.value,
                  availableRowsPerPage: const [2, 10, 40, 50, 100],
                  onRowsPerPageChanged: (newRowsPerPage) {
                    controller.setRowPerPage(newRowsPerPage);
                  },
                  showCheckboxColumn: true,
                  sortAscending: controller.sortAscending.value,
                  sortColumnIndex: controller.sortColumnIndex.value,
                  columns: [
                    DataColumn(
                      onSort: controller.sort,
                      label: Text(
                        "Customer",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      onSort: controller.sort,
                      label: Text(
                        "Course",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      onSort: controller.sort,
                      label: Text(
                        "Payment Mode",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      onSort: controller.sort,
                      label: Text(
                        "Discount",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      onSort: controller.sort,
                      label: Text(
                        "Purchased At",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  loadingWidget: () => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeader(PurchaseTableController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "All Purchases",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 20),
          ErpSearchField(
            onUpdate: (query) {
              controller.source.filterServerSide(query);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextButton(
              child: Row(
                children: const [
                  Icon(
                    CupertinoIcons.refresh,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text("Refresh"),
                ],
              ),
              onPressed: () {
                controller.refresh();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              child: Row(
                children: const [
                  Icon(
                    CupertinoIcons.add,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text("Add new"),
                ],
              ),
              onPressed: () async {
                controller.insertNew();
              },
            ),
          ),
        ],
      ),
    );
  }
}
