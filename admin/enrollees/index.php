<style>
    .img-avatar{
        width:45px;
        height:45px;
        object-fit:cover;
        object-position:center center;
        border-radius:100%;
    }
</style>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Enrollees</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="10%">
					<col width="25%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Date Created</th>
						<th>Reg. No</th>
						<th>Fullname</th>
						<th>Package</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$i = 1;
						$qry = $conn->query("SELECT e.*,CONCAT(lastname, ', ', firstname,' ',middlename) as fullname,p.name from `enrollee_list` e inner join package_list p on e.package_id = p.id order by e.`status` asc,unix_timestamp(e.`date_created`)");
						while($row = $qry->fetch_assoc()):
						
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td class=""><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><?php echo ($row['reg_no']) ?></td>
							<td><?php echo ucwords($row['fullname']) ?></td>
							<td><?php echo ($row['name']) ?></td>
							<td class="text-center">
                                <?php
                                    switch($row['status']){
                                        case '1':
											echo "<span class='badge badge-primary badge-pill'>Verified</span>";
											break;
										case '2':
											echo "<span class='badge badge-warning badge-pill'>In-Session</span>";
											break;
										case '3':
											echo "<span class='badge badge-success badge-pill'>Completed</span>";
											break;
										case '3':
											echo "<span class='badge badge-danger badge-pill'>Cancelled</span>";
											break;
										case '0':
											echo "<span class='badge badge-light badge-pill text-dark border'>Pending</span>";
											break;
                                    }
                                ?>
                            </td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item" href="./?page=enrollees/view_details&id=<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.verified').click(function(){
			_conf("Are you sure to verify this enrollee Request?","verified",[$(this).attr('data-id')])
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this enrollee permanently?","delete_enrollee",[$(this).attr('data-id')])
		})
		$('.view_data').click(function(){
			uni_modal("enrollee Details","enrollees/view_enrollee.php?id="+$(this).attr('data-id'),"large")
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable({
            columnDefs: [
                { orderable: false, targets: 5 }
            ],
        });
	})
	function delete_enrollee($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_enrollment",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>