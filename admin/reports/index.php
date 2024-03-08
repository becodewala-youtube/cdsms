<style>
    .img-avatar{
        width:45px;
        height:45px;
        object-fit:cover;
        object-position:center center;
        border-radius:100%;
    }
</style>
<?php 
$from = date("Y-m-d",strtotime(date("Y-m-d"). " -1 week"));
$to = date("Y-m-d");
?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Payment Reports</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<form action="" id="filter-data">
				<div class="row align-items-end">
					<div class="col-md-4">
						<div class="form-group">
							<label for="from" class="control-label">From</label>
							<input type="date" name="from" id="from" value="<?=  $from ?>" class="form-control form-control-border border-navy">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="to" class="control-label">To</label>
							<input type="date" name="to" id="to" value="<?=  $to ?>" class="form-control form-control-border border-navy">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<button class="btn btn-primary btn-flat"><i class="fa fa-filter"></i> Filter</button>
							<button class="btn btn-success btn-flat" type="button" id="print"><i class="fa fa-print"></i> Print</button>
						</div>
					</div>
				</div>
			</form>
        <div id="outprint">
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="5%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>DateTime</th>
						<th>Reg. No</th>
						<th>Fullname</th>
						<th class="text-right">Amount</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$i = 1;
						$qry = $conn->query("SELECT p.*,e.reg_no,CONCAT(e.lastname, ', ', e.firstname,' ',e.middlename) as fullname from `enrollee_list` e inner join payment_list p on p.enrollee_id = e.id order by unix_timestamp(e.`date_created`) asc");
						while($row = $qry->fetch_assoc()):
						
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td class=""><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><?php echo ($row['reg_no']) ?></td>
							<td><?php echo ucwords($row['fullname']) ?></td>
							<td class="text-right"><?php echo number_format($row['amount'],2) ?></td>
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
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('#print').click(function(){
            var _h = $("head").clone()
            var _p = $('#outprint').clone()
            var el = $("<div>")
            start_loader()
            $('script').each(function(){
                if(_h.find('script[src="'+$(this).attr('src')+'"]').length <= 0){
                    _h.append($(this).clone())
                }
            })
			var ao = "";
			if("<?= $from ?>" == "<?= $to ?>"){
				ao = "as of <?= date("M d, Y",strtotime($from)) ?>"
			}else{
				ao = "as of <?= (date("M d, Y",strtotime($from))). ' - '.(date("M d, Y",strtotime($to)))  ?>"
			}
            _h.find('title').text("Payment Report - Print View")
            _p.prepend("<hr class='border-navy bg-navy'>")
            _p.prepend("<div class='mx-5 py-4'><h1 class='text-center'><?= $_settings->info("name") ?></h1>"
                        +"<h5 class='text-center'>Enrollees' Payments Report</h5><h5 class='text-center'>"+ao+"</h5></div>")
            _p.prepend("<img src='<?= validate_image($_settings->info('logo')) ?>' id='print-logo' />")
            el.append(_h)
            el.append(_p)

            var nw = window.open("","_blank","height=800,width=1200,left=200")
                nw.document.write(el.html())
                nw.document.close()
                setTimeout(()=>{
                    nw.print()
                    setTimeout(() => {
                        nw.close()
                        end_loader()
                    }, 300);
                },300)
        })
	})
</script>